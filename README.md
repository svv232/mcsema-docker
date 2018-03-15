The following is a Dockerfile for for McSema the executable lifter that translates executable binaries from native machine code to LLVM bitcode developed by Trail of Bits.

It currently builds ,and has a basic setup for both IDA and IDAPYTHON. The remaining parts of the installation are slightly touched up dependencies from the McSema README.

Mcsema currently builds and is installed within the image build for Ubuntu 16.04 and amd64. Although the basic IDA dependencies are installed, I have yet to test the image with a full and working IDA set-up. If anyone can help with adding IDA to this environment for a full and working McSema container that would be great:)
