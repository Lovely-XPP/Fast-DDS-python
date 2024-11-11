$Env:CONDA_EXE = "C:/ProgramData/miniconda3\Scripts\conda.exe"
$Env:_CE_M = $null
$Env:_CE_CONDA = $null
$Env:_CONDA_ROOT = "C:/ProgramData/miniconda3"
$Env:_CONDA_EXE = "C:/ProgramData/miniconda3\Scripts\conda.exe"
$CondaModuleArgs = @{ChangePs1 = $True}
Import-Module "$Env:_CONDA_ROOT\shell\condabin\Conda.psm1" -ArgumentList $CondaModuleArgs

Remove-Variable CondaModuleArgs
conda activate 'C:\ProgramData\miniconda3' 
Import-Module 'C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\Microsoft.VisualStudio.DevShell.dll'
Enter-VsDevShell 91a01655

$scriptPath = Split-Path -Parent $PSCommandPath
cd "$scriptPath"
Remove-Item -Path "$scriptPath\build" -Recurse -Force
Remove-Item -Path "$scriptPath\install" -Recurse -Force
Remove-Item -Path "$scriptPath\log" -Recurse -Force

conda activate py38
colcon build
Remove-Item -Path "$scriptPath\build" -Recurse -Force
Remove-Item -Path "$scriptPath\install" -Recurse -Force

conda activate py39
colcon build
Remove-Item -Path "$scriptPath\build" -Recurse -Force
Remove-Item -Path "$scriptPath\install" -Recurse -Force

conda activate py310
colcon build
Remove-Item -Path "$scriptPath\build" -Recurse -Force
Remove-Item -Path "$scriptPath\install" -Recurse -Force

conda activate py311
colcon build
Remove-Item -Path "$scriptPath\build" -Recurse -Force
Remove-Item -Path "$scriptPath\install" -Recurse -Force

conda activate py312
colcon build
Remove-Item -Path "$scriptPath\build" -Recurse -Force
Remove-Item -Path "$scriptPath\install" -Recurse -Force
Remove-Item -Path "$scriptPath\log" -Recurse -Force