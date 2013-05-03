# Dead Trees Developer Documentation (Vagrant)

### Using Vagrant

1. Download the image (Ubuntu with rbenv preinstalled).

        vagrant box add deadtrees http://files.confabulator.net/ubuntu/precise32-rbenv.box

2. Start the Vagrant box.

        vagrant up

3. Shell into the machine.

        vagrant ssh

4. Install the dependencies.

        cd /vagrant
        bundle
		rbenv rehash

5. Create a PostgreSQL database and a role.

		sudo su - postgres
        createuser --createdb --superuser vagrant
        createdb --owner vagrant deadtrees_development

6. Start the application.

        shotgun -o 0.0.0.0

7. Open a web browser and navigate to [http://localhost:8080/ping](http://localhost:8080/ping).
   If all is well, you will see the word "pong".

**Note:** Shotgun will reload the application when you modify the source files.
