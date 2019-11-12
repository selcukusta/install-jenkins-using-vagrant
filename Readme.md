# Jenkins Installation & Configuration

## Plugin Management

### Build Features

- _(Check)_ Config File Provider

### Build Tools

- _(Uncheck)_ Ant
- _(Uncheck)_ Gradle

### Source Code Management

- _(Uncheck)_ Subversion

### User Management and Security

- _(Uncheck)_ PAM Authentication
- _(Uncheck)_ LDAP

### Notifications and Publishing

- _(Uncheck)_ Email Extension
- _(Uncheck)_ Mailer

### Languages

- _(Check)_ Local

## Docker Global Configuration

- `vagrant ssh jenkins-01`

- `which docker` and get the Docker installation path > `/usr/bin/docker`.

- Go to `http://172.81.81.200:8080/configureTools/` address and click **"Add Docker"** button. _Name_ should be `Docker` and _Installation Root_ should be `/usr`.

## Locale Configuration

- Change the default language of Jenkins via `http://172.81.81.200:8080/configure` URL. **Locale** section should be used for it.

## Docker Hub Credential

- URL: `http://172.81.81.200:8080/credentials/store/system/domain/_/newCredentials`
- Kind: `Username with password`
- Scope: `Global`
- Username: `[YOUR_DOCKER_HUB_USERNAME]`
- Password: `[YOUR_DOCKER_HUB_PASSWORD]`
- ID: `DockerHub`
- Description: `DockerHub`

## Gitlab Credential

- URL: `http://172.81.81.200:8080/credentials/store/system/domain/_/newCredentials`
- Kind: `Username with password`
- Scope: `Global`
- Username: `[YOUR_GITLAB_HUB_USERNAME]`
- Password: `[YOUR_GITLAB_HUB_PASSWORD]`
- ID: `Gitlab`
- Description: `Gitlab`

## New Job Definition

- Name: `Definition Name`
- Type: `Pipeline`
- Pipeline:
  - Definition: `Pipeline script from SCM`
  - SCM: `Git`
  - Repositories:
    - Repository URL: `[YOUR_GITLAB_PROJECT_URL]`
    - Credentials: `[GITLAB_CREDENTIAL_ID]`
  - Script Path: `[YOUR_JENKINS_FILE_PATH]`
