# openscad-exporter

A short shell script for exporting multiple stl models from single .scad file.

## Usage:

1. give the script executive permission.
```
chmod a+x test.sh
```

2. Modify your .scad file, adding additional info for exporting.

```
total={your total model amount};
if (modelId==1){
     echo("{model name for model 1}");
     {module for model 1}
}
if (modelId==2){
     echo("{model name for model 1}");
     {module for model 2}
}
if (modelId==3){
     echo("{model name for model 1}");
     {module for model 3}
}
```

3. Run the script

```
test.sh {your .scad file} {your output folder}
```

Example:
```
test.sh test.scad stl/
```
