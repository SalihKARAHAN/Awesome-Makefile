# makefile tutorial

step: dependencies_file dependencies_steps

| macro | explanation |
|-|-|
| $@ | step's definition name |
| $? | step's all dependencies |
| $< | step's just file dependencies | 

