# Vagrify

✨ Vagrify is Ansible roles and playbooks for simplefy install and configure virtual machines using Vagrant on Linux OS(KVM) and Windows OS (Hyper-V).

## Requirements for Windows baremetal server

In an official Vagrant's documentation you can find this:

>Vagrant does not yet know how to create and configure new networks for Hyper-V. When launching a machine with Hyper-V, Vagrant will prompt you asking what virtual switch you want to connect the virtual machine to.

To avoid it you have to create virtual switch in Hyper-V which is named `External Switch` and connect it to necessary interface. 

## Prepare inventory

- Edit `inventory/hosts.yaml` file and describe hosts for hosting virtual machines. It is neccessary for installing Hyper-V and KVM.
- Open `inventory/host_vars` folder and set the list of virtual machines for particular baremetal server. 

## Usage

> Before usage you have to install ansible.

```sh
ansible-playbook playbooks/prepare-virtual-machines.yaml --ask-pass
```

## Additional variables

If you have some trobles with usage Vagrant - you may additonaly set your vpn server using variable `external_gateway` in file `inventory/group_vars/all.yaml`. Then before downloading Vagrant boxes, ansible will set route to your vpn server. 

## License

MIT

**Free Software, Hell Yeah!**
