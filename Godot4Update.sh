#!/bin/bash
grep -rl "onready" . --exclude-dir=.git,Godot4Update.sh | xargs sed -i 's/@onready /@onready /'

grep -rl "extends RigidBody3D" . --exclude-dir=.git | xargs sed -i 's/extends RigidBody/extends RigidBody3D/'
grep -rl "extends RigidBody3D3D2D" . --exclude-dir=.git | xargs sed -i 's/extends RigidBody2D/extends RigidBody2D/'

grep -rl "PointLight2D" . --exclude-dir=.git | xargs sed -i 's/Light2D/PointLight2D/'

grep -rl "Camera3D" . --exclude-dir=.git | xargs sed -i 's/Camera/Camera3D/'
grep -rl "Camera3D3D2D" . --exclude-dir=.git | xargs sed -i 's/Camera2D/Camera2D/'
grep -rl "if i.get_name() != \"Camera3D3D\":" . --exclude-dir=.git | xargs sed -i 's/if i.get_name() != "Camera":/if i.get_name() != "Camera":/'

grep -rl "DirectionalLight3D" . --exclude-dir=.git | xargs sed -i 's/DirectionalLight/DirectionalLight3D/'
grep -rl "DirectionalLight3D3D2D" . --exclude-dir=.git | xargs sed -i 's/DirectionalLight2D/DirectionalPointLight2D/'

grep -rl "SpotLight3D" . --exclude-dir=.git | xargs sed -i 's/SpotLight/SpotLight3D/'
grep -rl "SpotLight3D3D2D" . --exclude-dir=.git | xargs sed -i 's/SpotLight2D/SpotPointLight2D/'

grep -rl "OmniLight3D" . --exclude-dir=.git | xargs sed -i 's/OmniLight/OmniLight3D/'
grep -rl "OmniLight3D3D2D" . --exclude-dir=.git | xargs sed -i 's/OmniLight2D/OmniPointLight2D/'

grep -rl "Node3D" . --exclude-dir=.git | xargs sed -i 's/Spatial/Node3D/'












