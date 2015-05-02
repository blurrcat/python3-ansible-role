## python3-ansible-role [![Build Status](https://travis-ci.org/alliedplatform/python3-ansible-role.png)](https://travis-ci.org/alliedplatform/python3-ansible-role)

Ansible role for installing a Python 3.x version from source.

#### Supported Platforms

- Ubuntu 14.04 LTS (x86-64)

#### Requirements

- Python 2.7 (required to run Ansible)
- Ansible 1.9 or greater.

#### Role Dependencies

- [alliedplatform.security](https://github.com/alliedplatform/security-ansible-role)
- [alliedplatform.build-deps](https://github.com/alliedplatform/build-deps-ansible-role)

#### Variables

##### Required variables

- `python_major_minor_version` - the Python version which includes the major and minor levels (MAJOR.MINOR), but does **not** contain the patch level. This variable will be used to identify the specific Python binary to be executed in commands.
- `python_major_minor_patch_version` - the Python version which includes the major, minor and patch levels (MAJOR.MINOR.PATCH). This will be the version used to determine the Python source package to retrieve and build. The major and minor levels for this variable **must** be the same as in the `python_major_minor_version` variable described above.
- `python_compressed_source_md5sum` - the md5sum for the XZ-compressed Python source. This is used to verify the integrity of the file after it is downloaded.
- `python_virtualenvs` - a list of YAML dictionaries describing the Python virtual environments that will be created and the pip requirements manifest that specifies what Python packages to install in each. This variable will only be effective if the `python_virtualenv_install` variable is set to `yes`.

Example:

```
python_virtualenvs:
  - name: virtualenv1
    requirements: /app/someapp1/requirements.txt
  - name: virtualenv2
    requirements: /app/someapp2/requirements.txt
```

##### Optional variables

- `python_configuration_dir` - the absolute directory to hold the build flags manifest for the Python installation. This directory will hold a `.python_compilation_flags` manifest which, in turn, contains the Python version that was build along with the build flags used. The `.python_compilation_flags` manifest is used by Ansible to check if any changes are needed to the host on subsequent playbook runs. By default, this is set to `/etc/python`.
- `python_compressed_source_path` - the absolute destination path for the XZ-compressed Python source when downloaded to the host. The compressed Python source will be deleted after it is extracted. By default, this is set to `/tmp/python.tar.xz`.
- `python_source_dir` - the absolute uncompressed Python source directory (build directory). By default, this is set to `/src/python`.
- `python_source_configure_flags` - the build flags to use during the makefile generation.
- `python_install_prefix_dir` - the absolute directory to where the Python `bin`, `include`, `lib` and `share` directories and files will be installed after the build. By default, this is set to `/opt/python`.
- `python_binaries_dir` - the absolute directory to the Python `bin` directory.
- `python_libraries_dir` - the absolute directory to the Python `lib` directory.
- `python_exec_path` - the absolute path to the Python interpreter binary that was installed after the build process.
- `python_pip_exec_path` - the absolute path to the `pip` executable.
- `python_virtualenv_exec_path` - the absolute path to the `virtualenv` executable.
- `python_user` - the user who owns the Python installation and the contents of the Python virtual environments. The default setting is `python-data`.
- `python_group` - the user group to which the `python_user` belongs. The default setting is `python-data`.
- `python_virtualenv_install` - determines if Python virtual environments are to be installed. The default setting is `yes`.
- `python_virtualenv_home_dir` - the absolute directory to where the Python virtual environments will be created.

#### Testing

##### Local tests

A Vagrantfile has been included with this project to provision a virtual machine with the Ansible role using some test data. Due to the fact that this role has hard dependencies on other roles, the typical `vagrant up` command cannot be run directly. Instead, a `local_test.sh` Bash script is provided at the root of this repository to gather the required Ansible roles from the Ansible Galaxy service and then provision the Vagrant virtual machine. Please execute the following steps to use the `local_test.sh` script:

1. Provide the `local_test.sh` script with execute permissions.

```
$ chmod +x local_test.sh
```

2. Run the `local_test.sh` script.

```
$ ./local_test.sh
```

The `local_test.sh` script will report either a **pass** or **fail** for the
idempotence test at the conclusion of the script execution.

To destroy the Vagrant virtual machine after the provisioning process is complete, execute `vagrant destroy` and follow the prompts.

##### Automated tests

Automated tests to check the correctness of the Ansible playbook syntax and the idempotency of the role are executed after a commit to GitHub. These automated tests are performed by [Travis CI](https://travis-ci.org/).

#### Notes

None.

#### License

The content of this repository is licensed under the [The MIT License (MIT)](http://opensource.org/licenses/MIT).

Some of the testing infrastructure is based from the work of Pieterjan Vandaele and others. Their work is also licensed under The MIT License and the license can be found [here](https://github.com/ANXS/python/blob/master/LICENSE).
