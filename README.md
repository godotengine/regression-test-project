# Godot regression test project
This repository contains project which is used to find regressions in Godot.

It aims to check as much as possible functions and states, be easy in maintain and provide reproducible results.

## Basic Informations
This project contains a few different scenes and `Start.tscn`(default one) which opens every other scene. 

List of this scenes are available in `Autoload.gd` file.

![B](https://user-images.githubusercontent.com/41945903/104442905-060e7c00-5596-11eb-9000-f9bb338ece79.png)

It is possible manually set how long project need to be executed from command line, just by adding at the end number of seconds - `godot 40`.

At first `all_in_one` scenes opens, execute `_ready` function and exit. 

The available time(default 25s) is divided equally between each scene in `alone_steps`.

Then, one by one, each scene is created and after a certain amount of time it is deleted and another scene from the `alone_steps` takes its place.

This project is running in CI with a version of Godot compiled with Address and Undefined sanitizers(`scons use_asan=yes use_ubsan=yes`) so without these options it won't always be possible to detect the bug or get so detailed backtrace.

## Searching for a malfunctioning scene
### Logs
When searching through the logs for the error you may come across something like this
```
Changed scene to res://Rendering/Lights2D/Lights2D.tscn
Test is running now 35 seconds
Test is running now 40 seconds
Changed scene to res://Rendering/Lights3D/Lights3D.tscn
##### CRASH #####
Godot crashed with signal ...
```
This log indicates 2 potentially broken scenes
- `Lights3D.tscn` - crash occured because scene started work
- `Lights2D.tscn` - crash occured because scene was removed
### Autoload
You can freely comment out selected lines in `alone_steps` or `all_in_one` to choose which scenes will run `Start.tscn`.  
You can also use `time_to_show` variable to set time how long the project will run.  

![Autoloads](https://user-images.githubusercontent.com/41945903/115044743-16582f00-9ed6-11eb-889f-4f07ad6c7d13.png)

### File System
The last way is to manually run each scene from the file system to find the one malfunctioning.

![File](https://user-images.githubusercontent.com/41945903/115044733-13f5d500-9ed6-11eb-9364-43a1a142a6f1.png)

## "Safe" fuzzer
A scene that will probably give people a hard time quite often is `FunctionExecutor.tscn`.  
This is a fuzzer, but with removed ability to use random argument values (the arguments are identical every time it is run).  
When the engine crashes, in logs usually will be something like this:
```
#################### SkeletonModification2DPhysicalBones ####################
SkeletonModification2DPhysicalBones.set_physical_bone_node
Parameters [100, ]
ERROR: Joint index out of range!
   at: set_physical_bone_node (scene/resources/skeleton_modification_2d_physicalbones.cpp:259)
SkeletonModification2DPhysicalBones.get_physical_bone_node
Parameters [100]
ERROR: Joint index out of range!
   at: get_physical_bone_node (scene/resources/skeleton_modification_2d_physicalbones.cpp:265)
SkeletonModification2DPhysicalBones.fetch_physical_bones
Parameters []
scene/resources/skeleton_modification_2d_physicalbones.cpp:186:2: runtime error: member access within null pointer of type 'struct SkeletonModificationStack2D'
handle_crash: Program crashed with signal 11
Dumping the backtrace. Please include this when reporting the bug on godotengine/godot/issues
[1] bin/godot.linuxbsd.tools.64s() [0x1e697d8] (/home/runner/work/godot/godot/platform/linuxbsd/crash_handler_linuxbsd.cpp:54)
[2] /lib/x86_64-linux-gnu/libc.so.6(+0x46210) [0x7fd1ca5b0210] (??:0)
```
There are some interesting things to discuss here.  
This line shows what class we are testing now
```
#################### SkeletonModification2DPhysicalBones ####################
```
which method
```
SkeletonModification2DPhysicalBones.set_physical_bone_node
```
and which parameters (here are two arguments - `100`,  \` \`(empty string))
```
Parameters [100, ]
```
To make testing easier, each object is created from scratch and by looking at the class definition in Godot - `set_physical_bone_node(int, String)` we can create an expression that is executed on this line:
```
SkeletonModification2DPhysicalBones.new().set_physical_bone_node(100,"")
```
Then you can see errors caused by invalid arguments, which you can ignore if they don't cause other crashes/leaks etc.
```
ERROR: Joint index out of range!
   at: get_physical_bone_node (scene/resources/skeleton_modification_2d_physicalbones.cpp:265)
```
At the end we can see Godot's crash log with additional information that tried to use null pointer incorrectly:
```
scene/resources/skeleton_modification_2d_physicalbones.cpp:186:2: runtime error: member access within null pointer of type 'struct SkeletonModificationStack2D'
handle_crash: Program crashed with signal 11
Dumping the backtrace. Please include this when reporting the bug on godotengine/godot/issues
[1] bin/godot.linuxbsd.tools.64s() [0x1e697d8] (/home/runner/work/godot/godot/platform/linuxbsd/crash_handler_linuxbsd.cpp:54)
[2] /lib/x86_64-linux-gnu/libc.so.6(+0x46210) [0x7fd1ca5b0210] (??:0)
```
we can assume that this is caused by calling the function immediately before the crash:
```
SkeletonModification2DPhysicalBones.fetch_physical_bones
Parameters []
```
We can test this by running a function in Godot that looks like this(just add `.new()` after class name and fill function arguments from `Parameters`):
```
SkeletonModification2DPhysicalBones.new().fetch_physical_bones()
```

## Nodes
Scene simply adds and removes at once all available nodes.   
It is used to catch early very obvious and easy to reproduce bugs.

## ReparentingDeleting
This is more advanced variation of Nodes scene.  
In random order adds, remove and move in scene tree nodes. It may not sound spectacular, but it sometimes allows you to find bugs that are hard to detect.

## Others
Scenes like `Physics2D.tscn` or `Lights3D.tscn` are normal scenes with specific types of nodes. They are only used to manually check visual differences between different Godot versions.

![Physics](https://user-images.githubusercontent.com/41945903/115050994-9da8a100-9edc-11eb-99f6-9375ef917be1.png)

## TODO
- Add physics test - currently blocked by several crashes - https://github.com/godotengine/godot/issues/47440

## 4.0 version limitations
ReparentingDeleting is in 4.0 only Reparenting - bug https://github.com/godotengine/godot/issues/45471  
Some scenes available in 3.x branch, but due freezes and long loading times are disabled.

## Epilepsy Warning
Due using by project a lot of functions from each type of Node, screen may flicker, images and objects may change randomly color and size which may lead some users to health problems.

## Problems with project
The project should not cause too many problems in CI when adding and removing features in Godot, since it don't uses too much functions but for example removing a base type e.g. `TYPE_INT` or changes in GDScript(e.g. changing `instance` to `instantiate`) can mess it up.

If you have problem with this project e.g. in CI, just ping me -> @qarmin <- and after that I will try help to fix issues which you have with it or add exception to project.


