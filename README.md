## python3-ansible-role [![Build Status](https://travis-ci.org/alliedplatform/python3-ansible-role.png)](https://travis-ci.org/alliedplatform/python3-ansible-role)

Ansible role for installing a Python 3.x version from source.

#### Supported Platforms

- Ubuntu 14.04 LTS (x86-64)

#### Requirements

- Python 2.7 (required to run Ansible)
- Ansible 1.9 or greater.

#### Role Dependencies

- [ANXS.build-essential](https://github.com/ANXS/build-essential)
- [alliedplatform.security](https://github.com/alliedplatform/security-ansible-role)

#### Variables

##### Python version options

- `python_version` - the Python version to be installed.
- `python_compressed_source_md5sum` - the md5sum for the XZ-compressed Python source. This is used to verify the integrity of the file after it is downloaded.

##### Python build options

- `python_configuration_dir` - the absolute directory to hold the build flags manifest for the Python installation. This directory will hold a `.python_compilation_flags` manifest which, in turn, contains the Python version that was build along with the build flags used. The `.python_compilation_flags` manifest is used by Ansible to check if any changes are needed to the host on subsequent playbook runs. By default, this is set to `/etc/python`.
- `python_compressed_source_path` - the absolute destination path for the XZ-compressed Python source when downloaded to the host. The compressed Python source will be deleted after it is extracted. By default, this is set to `/var/tmp/python.tar.xz`.
- `python_source_dir` - the absolute uncompressed Python source directory (build directory). By default, this is set to `/usr/src/python`.
- `python_source_default_configure_flags` - the build flags to use during the makefile generation. By default, only the `--enable-shared` is provided to configure script.

#### Notes

None.

#### License

The content of this repository is licensed under the [The MIT License (MIT)](http://opensource.org/licenses/MIT).

Some of the testing infrastructure is based from the work of Pieterjan Vandaele and others. Their work is also licensed under The MIT License and the license can be found [here](https://github.com/ANXS/python/blob/master/LICENSE).
