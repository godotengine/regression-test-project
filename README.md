## Godot regression test project
This repository contains Godot project which is tested in offical Godot repository(3.2 branch)

It aims to be complex project, which will allow to find crashes, leaks and invalid memory writes before PR is merged.

Sadly it can't find any logic errors.

For now it is really simple, but some I think that it can be improved over time.

## How it works?
### Autoload
There is only one scene which is loaded when project starts - "Autoload.gd".
It handle exiting project after selected number of seconds

When opening any scene, automatically time to exit is set.

### Checking All scenes
There are two scenes which opens all scenes:
- All.tscn - opens all scenes at once
- Start.tscn - opens each scene one by one

### AIO
This are scenes which only opens once, because there is no need to open it more times(no scripts or only with `_ready` function).

### Other Scenes
Each other scenes checks specific types of nodes like lights, rendering or physics.

## Contributions 
Contributions are welcome.

For now there is no requirements to format code.

New functionalities(e.g. physics checks) should be done in different folders(cleaner view to resources)

## Epilepsy Warning
Due using by project a lot of functions from each type of Node, screen may flicker, images and objects may change randomly color and size which may lead some users to health problems.
