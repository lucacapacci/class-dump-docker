# class-dump-docker
A dockerized version of the class-dump tool

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

From your CLI, in any directory, run the following command:
- Intel architecture:
```
docker run --rm -it -v "/path/of/the/binary/you/want/to/analyze":/b class-dump-docker
```
- Apple Silicon:
```
docker run --platform linux/amd64 --rm -it -v "/path/of/the/binary/you/want/to/analyze":/b class-dump-docker
```
This should output all the interfaces and other relevant information.
