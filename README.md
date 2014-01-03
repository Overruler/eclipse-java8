Java 8 Eclipse Patches
======================

Build an update site containing Feature Patches that can be applied to
Eclipse 4.3.

The patches are based on code in BETA_JAVA8 branches of various git
repositories on git.eclipse.org.

## Running the build

You will need a JDK8 to run the build. (Required to build org.eclipse.jdt.annotation plugin
in the jdt.core feature patch).

 1. Using [Eclipse SDK 4.3.1](http://download.eclipse.org/eclipse/downloads/drops4/R-4.3.1-201309111000/download.php?dropFile=eclipse-SDK-4.3.1-win32-x86_64.zip) clone:
	1. https://github.com/Overruler/eclipse-java8.git (this repository).
	2. https://github.com/Overruler/eclipse.jdt.core.git (eclipse.jdt.core, BETA_JAVA8 branch).
	3. https://github.com/Overruler/eclipse.jdt.debug.git (eclipse.jdt.debug, BETA_JAVA8 branch).
	4. https://github.com/Overruler/eclipse.jdt.ui.git (eclipse.jdt.ui, BETA_JAVA8 branch).
	5. https://github.com/Overruler/rt.equinox.framework.git (rt.equinox.framework, BETA_JAVA8 branch).
	6. https://github.com/Overruler/eclipse.pde.ui.git (eclipse.pde.ui, BETA_JAVA8 branch).
 2. Open the `git` subdirectory of this repository and run the script `java8-link.cmd`.
    This creates directory junctions linking the aforementioned repositories. Creating junctions 
    requires administrative privileges.
 3. From Eclipse, run the Ant script `build.xml`. 
		This changes the parent artifact name for Maven build. 
		The `build.xml` script also has a target to undo this change.
 4. From Eclipse, run Maven on the `pom.xml` file with goals `clean install`.
    
Upon successful completion an update site is built in `org.springsource.ide.eclipse.java8.site/target/site`.
   
The contents of this site can be installed into the Eclipse 4.3.1 instance.

## Instructions for a GNU/Linux:
 1. Clone this repo.
 2. Cd into the `git` subdirectory and run the script `java8-clone`.
    This clones all the required external git repo's and checks out
    the BETA_JAVA8 branches.
 3. From the root of this repo run the commands
    `export JAVA_HOME=<path-to-a-JDK8>`
    `mvn clean install` (Requires maven 3.0 to use tycho).
    
