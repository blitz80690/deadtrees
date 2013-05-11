# Dead Trees Developer Documentation (Vagrant)

### Using Vagrant

1. Make sure that [VirtualBox](https://www.virtualbox.org) and
   [Vagrant](http://www.vagrantup.com) are installed and up-to-date.

2. Download the image (Ubuntu with rbenv preinstalled).

        vagrant box add deadtrees http://files.confabulator.net/ubuntu/precise32-rbenv.box

3. Start the Vagrant box.

        vagrant up

4. Shell into the machine.

        vagrant ssh

5. Install the dependencies.

        cd /vagrant
        bundle
        rbenv rehash

6. Create a PostgreSQL database and a role.

        sudo su - postgres
        createuser --createdb --superuser vagrant
        createdb --owner vagrant deadtrees_development
        exit

7. Generate a session key.

        openssl rand -out session.key 64

8. Start the application.

        foreman start

9. Open a web browser and navigate to [http://localhost:8080/ping](http://localhost:8080/ping).
   If all is well, you will see the word "pong".

**Note:** Shotgun will reload the application when you modify the source files.
