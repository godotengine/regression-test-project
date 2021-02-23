## Godot regression test project
This repository contains Godot project which is tested in offical Godot repository(3.2 branch)

It aims to be complex project, which will allow to find crashes, leaks and invalid memory writes before PR is merged.

Sadly it can't find automatically any logic errors.

## Reproduce bugs
If CI find bug, you can easily without much effort check which scene cause problems(stacktrace, address or leak sanitizer log will be available).

All main scenes are independent of each other(only `Autoload.gd` is required), so it is easy to disable some for testing.

To create minimal test scene:
- Look at the console output - there is printed info about current used scene
- If you run `Start.tscn` scene(which run other scenes in queue) then you can modify list of scenes which needs to be run in `Autoload.gd` by commenting records in `alone_steps` or `all_in_one` array(just like in picture)
![Zrzut ekranu z 2021-01-13 11-52-41](https://user-images.githubusercontent.com/41945903/104442905-060e7c00-5596-11eb-9000-f9bb338ece79.png)

## How it works?
### Autoload
There is only one scene which is loaded when project starts - "Autoload.gd".
It handle exiting project after selected number of seconds

When opening any scene, automatically time to exit is set.

If running projet with e.g. this parameters
```
godot 20 
```
Then time is set to 20 seconds so it means that if scenes is 10 (EACH in `alone_steps` array + one for ALL scenes in `all_in_one` array), then each scene will be show for 2 seconds

### Checking All scenes at once
There are two scenes which opens all scenes:
- All.tscn - opens all scenes at once
- Start.tscn - opens each scene one by one

### "Safe" Fuzzer
Available inside `AutomaticBugs` directory, check all methods with specific arguments in allowed classes.  
During calculations, to output should be written informations about current classes and executed functions with arguments e.g.
```
############### CLASS ############### - PopupMenu
add_icon_radio_check_shortcut
Parameters [[InputEventMouseMotion:12379], [SoftBody:12380], -109, True]
```
This fuzzer should in most situations be safe to use, because always use same set of arguments in functions, and objects are cleared before executing next function.  

This tool is developed in external repository - https://github.com/qarmin/Qarminer.

### AIO
This are scenes which only opens once, because there is no need to open it more times - used to check loading of specific types of nodes or executing its `_ready` functions.

### MainScenes
Collections of all nodes, which are after some time simply removed and added to scene.

### ReparentingDeleting
This scene randomly reparent, add or delete nodes inside it, to check correctness this operations.

### Other Scenes
Each other scenes checks specific types of nodes like lights, rendering, physics, text.

## Epilepsy Warning
Due using by project a lot of functions from each type of Node, screen may flicker, images and objects may change randomly color and size which may lead some users to health problems.

## Problems with project
If you have problem with this project e.g. in CI, just ping me -> @qarmin <- and after that I will try help to fix issues which you have with it or add exception to project.
