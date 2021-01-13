## Godot regression test project
This repository contains Godot project which is tested in offical Godot repository(3.2 branch)

It aims to be complex project, which will allow to find crashes, leaks and invalid memory writes before PR is merged.

Sadly it can't find automatically any logic errors.

## Reproduce bugs
If CI find bug, you can easily without much effort check which scene cause problems.

Each scene is independent of the other, so it is easy to disable some for testing.

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
godot 20 -v
```
Then time is set to 20 seconds so it means that if scenes is 10 (EACH in `alone_steps` array + one for ALL scenes in `all_in_one` array), then each scene will be show for 2 seconds

### Checking All scenes at once
There are two scenes which opens all scenes:
- All.tscn - opens all scenes at once
- Start.tscn - opens each scene one by one

### AIO
This are scenes which only opens once, because there is no need to open it more times(no scripts or only with `_ready` function).

### Other Scenes
Each other scenes checks specific types of nodes like lights, rendering, physics, text or reparenting.

## Contributions 
Contributions are welcome.

For now there is no requirements to format code.

New functionalities(e.g. physics checks) should be done in different folders(cleaner view to resources)

## Epilepsy Warning
Due using by project a lot of functions from each type of Node, screen may flicker, images and objects may change randomly color and size which may lead some users to health problems.
