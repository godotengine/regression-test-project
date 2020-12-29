#!/bin/bash

grep -rl "onready" . --exclude-dir=.git| xargs sed -i 's/onready /@onready /'


grep -rl "SpatialMaterial" . --exclude-dir=.git | xargs sed -i 's/SpatialMaterial/StandardMaterial3D/'

grep -rl "extends RigidBody" . --exclude-dir=.git | xargs sed -i 's/extends RigidBody/extends RigidBody3D/'
grep -rl "extends RigidBody3D2D" . --exclude-dir=.git | xargs sed -i 's/extends RigidBody3D2D/extends RigidBody2D/'

mv "Rendering/Lights2D/Light2D.tscn" "Rendering/Lights2D/PointLight2D.tscn" 
mv "Rendering/Lights2D/Light2D.gd" "Rendering/Lights2D/PointLight2D.gd" 
grep -rl "Light2D" . --exclude-dir=.git | xargs sed -i 's/Light2D/PointLight2D/'

mv "Rendering/Lights3D/Camera.gd" "Rendering/Lights3D/Camera3D.gd" 
grep -rl "Camera" . --exclude-dir=.git | xargs sed -i 's/Camera/Camera3D/'
grep -rl "Camera3D2D" . --exclude-dir=.git | xargs sed -i 's/Camera3D2D/Camera2D/'
grep -rl "Camera3DTexture" . --exclude-dir=.git | xargs sed -i 's/Camera3DTexture/CameraTexture/'
grep -rl "if i.get_name() != \"Camera3D\":" . --exclude-dir=.git | xargs sed -i 's/if i.get_name() != "Camera":/if i.get_name() != "Camera":/'

mv "Rendering/Lights3D/DirectionalLight.gd" "Rendering/Lights3D/DirectionalLight3D.gd" 
grep -rl "DirectionalLight" . --exclude-dir=.git | xargs sed -i 's/DirectionalLight/DirectionalLight3D/'
grep -rl "DirectionalLight3D2D" . --exclude-dir=.git | xargs sed -i 's/DirectionalLight3D2D/DirectionalPointLight2D/'

mv "Rendering/Lights3D/SpotLight.gd" "Rendering/Lights3D/SpotLight3D.gd" 
grep -rl "SpotLight" . --exclude-dir=.git | xargs sed -i 's/SpotLight/SpotLight3D/'
grep -rl "SpotLight3D2D" . --exclude-dir=.git | xargs sed -i 's/SpotLight3D2D/SpotPointLight2D/'

mv "Rendering/Lights3D/OmniLight.gd" "Rendering/Lights3D/OmniLight3D.gd" 
grep -rl "OmniLight" . --exclude-dir=.git | xargs sed -i 's/OmniLight/OmniLight3D/'
grep -rl "OmniLight3D2D" . --exclude-dir=.git | xargs sed -i 's/OmniLight3D2D/OmniPointLight2D/'

mv "MainScenes/Spatial.tscn" "MainScenes/Node3D.tscn" 
mv "MainScenes/Spatial.gd" "MainScenes/Node3D.gd" 
grep -rl "Spatial" . --exclude-dir=.git | xargs sed -i 's/Spatial/Node3D/'








