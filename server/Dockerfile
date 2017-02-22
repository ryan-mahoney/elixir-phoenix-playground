FROM elixir:1.4.2

ENV DEBIAN_FRONTEND=noninteractive

# Install hex
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

# Install NodeJS 6.x and the NPM
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y -q nodejs

# Install Supervisor
RUN apt-get install -y supervisor

# Install PostgreSQL
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get install wget ca-certificates
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y postgresql-9.6
RUN locale-gen en_US.UTF-8

# Install netstat, this allows us to start phoenix after postgresql
RUN apt-get install net-tools

# Install Configurations
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config/postgresql_ctl.sh /root/postgresql_ctl.sh
COPY config/phoenix_ctl.sh /root/phoenix_ctl.sh

ENTRYPOINT ["/usr/bin/supervisord", "--nodaemon", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
