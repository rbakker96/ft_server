<p align="center">
  <img src="https://github.com/rbakker96/images/blob/master/codam_logo.png">
</p>

# ft_server 
This is a System Administration subject. You will discover Docker and you will set up your first web server.

---

### Project summary

This topic is intended to introduce you to system administration. It will make you aware
of the importance of using scripts to automate your tasks. For that, you will discover
the "docker" technology and use it to install a complete web server. This server will run
multiples services: Wordpress, phpMyAdmin, and a SQL database.

---

### Technical considerations

- You must set up a web server with Nginx, in only one docker container. The container OS must be debian buster.
- Your web server must be able to run several services at the same time. The services will be a WordPress website, phpMyAdmin and MySQL. You will need to make sure your SQL database works with the WordPress and phpMyAdmin.
- Your server should be able to use the SSL protocol.
- You will have to make sure that, depending on the url, your server redirects to the correct website.
- You will also need to make sure your server is running with an autoindex that must be able to be disabled.

---

### Used resources

- <a href="https://docs.docker.com/get-started/overview/" target="_blank">Docker documentation</a>
- <a href="https://github.com/wp-cli/wp-cli" target="_blank">WP-cli</a>
- <a href="https://lemp.io/" target="_blank">LEMP stack resources</a>
- <a href="https://www.linuxbabe.com/debian/install-lemp-stack-debian-10-buster" target="_blank">LEMP stack tutorial</a>
- <a href="https://www.nginx.com/resources/wiki/start/topics/recipes/wordpress/" target="_blank">Nginx config resources</a>

