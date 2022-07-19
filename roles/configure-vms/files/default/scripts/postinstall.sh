echo "[Install packages]"
apt update
apt install ca-certificates curl gnupg lsb-release sshpass nfs-common openssh-server -y

echo "[Prepare users]"
if [[ -z "${ANSIBLE_PASSWORD}" ]]; then
  echo "Ansible password was not set. Skipping..."
else
  echo "Adding user 'ansible' if not exist. Password: ${ANSIBLE_PASSWORD}"
  id -u ansible &>/dev/null || useradd -p $(openssl passwd -1 ${ANSIBLE_PASSWORD}) ansible
  usermod -aG sudo ansible
  echo "Change password for user 'vagrant'"
  echo "vagrant:${ANSIBLE_PASSWORD}" | sudo chpasswd
fi

echo "[Show ip info]"
ip -4 a
