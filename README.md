# class-dump-docker
A dockerized version of the class-dump tool, good for any OS.

### **Step 1: Create the image**

Clone this repo, navigate into its root folder and then run this command:

- Intel architecture:
```
docker build -t class-dump-docker . --no-cache
```
- Apple Silicon:
```
docker build --platform linux/amd64 -t class-dump-docker . --no-cache
```

Once this command completes, you'll have the image on your computer, ready to use.

-----

### **Step 2: Use `class-dump`**

Run the following command:
- Intel architecture:
```
docker run --rm -it -v "/path/of/the/binary/you/want/to/analyze":/b class-dump-docker
```
- Apple Silicon:
```
docker run --platform linux/amd64 --rm -it -v "/path/of/the/binary/you/want/to/analyze":/b class-dump-docker
```
This should output all the interfaces and other relevant information.

-----

### **Reading the help**
- Intel architecture:
```
docker run --rm -it class-dump-docker /classdump
```
- Apple Silicon:
```
docker run --rm -it --platform linux/amd64 class-dump-docker /classdump
```
-----
### **Advanced use**

Step 1: create a container and get into its CLI by running the following command:
- Intel architecture:
```
docker run --rm -it -v "/path/of/your/working/directory":/b class-dump-docker bash
```
- Apple Silicon:
```
docker run --rm -it --platform linux/amd64 -v "/path/of/your/working/directory":/workingdir class-dump-docker bash
```
Step 2: execute any operation with class-dump on files in your working directory. The tool executable is in path `/classdump` and your working directory is in path `/workingdir`. For instance, the following command lists all arches in a binary called `mybinary` in your working directory:
```
/classdump /workingdir/mybinary  --list-arches
```
-----

Credits:
- made by: [Andrea Paiano](https://www.linkedin.com/in/andrea-paiano-27851520/) and [Luca Capacci](https://www.linkedin.com/in/lucacapacci/)
- based on: [class-dump](https://github.com/nygard/class-dump) and [class-dump-linux](https://github.com/tedzhang2891/class-dump-linux)
