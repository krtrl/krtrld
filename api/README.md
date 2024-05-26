# krtrl API Documentation
This is the v1 API documentation for krtrl.

`/api/v1/` is the base path for all API endpoints. v1 is the version of the API.

## Endpoints
- [GET /api/v1/](#get-apiv1)
- [GET /api/v1/systemInfo](#get-apiv1systemInfo)
- [GET /api/v1/packageList](#get-apiv1packageList)
- [GET /api/v1/containers](#get-apiv1containers)
- [GET /api/v1/services](#get-apiv1services)
- [GET /api/v1/logs](#get-apiv1logs)
- [POST /api/v1/services](#post-apiv1services)
- [POST /api/v1/packageList](#post-apiv1packageList)
- [POST /api/v1/containers](#post-apiv1containers)

### GET /api/v1/
This is the base endpoint for the API. It returns a JSON object with the full API version and the daemon name.

#### Request
```http
GET /api/v1/
```

#### Response
```json
{
  "version": "v1.0.0",
  "daemon": "krtrld"
}
```

### GET /api/v1/systemInfo
This endpoint returns the system information of the server.

#### Request
```http
GET /api/v1/systemInfo
```

#### Response
```json
{
  "system": {
    "hostname": "krtrl",
    "os": "Ubuntu 20.04",
    "packageManager": "apt",
    "initSystem": "systemd",
    "platform": "linux",
    "arch": "amd64",
    "cpus": 4,
    "memory": "16GiB"
    "disks": {
        "sda": {
            "size": "1TiB",
            "used": "500GiB",
            "free": "500GiB"
        },
        "sdb": {
            "size": "1TiB",
            "used": "500GiB",
            "free": "500GiB"
        }
    }
  }
}
```

### GET /api/v1/packageList
This endpoint returns the list of all installed packages on the server.

#### Request
```http
GET /api/v1/packageList
```

#### Response
```json
{
  "packages": [
    {
      "name": "docker",
      "version": "20.10.7",
      "size": "100MiB"
    },
    {
      "name": "docker-compose",
      "version": "1.29.2",
      "size": "50MiB"
    },
    {
      "name": "nginx",
      "version": "1.18.0",
      "size": "200MiB"
    }
  ]
}
```

### GET /api/v1/containers
This endpoint returns the list of all Docker containers running on the server.

#### Request
```http
GET /api/v1/containers
```

#### Response
```json
{
  "containers": [
    {
      "name": "nginx",
      "image": "nginx:latest",
      "status": "running",
      "ports": [
        {
          "host": "80",
          "container": "80"
        }
      ]
    },
    {
      "name": "mysql",
      "image": "mysql:latest",
      "status": "running",
      "ports": [
        {
          "host": "3306",
          "container": "3306"
        }
      ]
    }
  ]
}
```

### GET /api/v1/services
This endpoint returns the list of all system services running on the server.

#### Request
```http
GET /api/v1/services
```

#### Response
```json
{
  "services": [
    {
      "name": "nginx",
      "status": "active",
      "description": "The NGINX HTTP and reverse proxy server"
    },
    {
      "name": "mysql",
      "status": "active",
      "description": "MySQL database server"
    }
  ]
}
```

### POST /api/v1/services
This endpoint allows you to start, stop, or restart a system service on the server.

#### Request
```http
POST /api/v1/services
Content-Type: application/json

{
  "name": "nginx",
  "action": "restart",
  "when": "now"
}
```

#### Response
```json
{
  "action": "success",
  "message": "Service nginx restarted successfully"
}
```

### GET /api/v1/logs
This endpoint returns the logs of a specific Docker container or service running on the server.

#### Request
```http
GET /api/v1/logs?name=nginx&type=container&lines=100
```

#### Response
```json
{
  "logs": "2023-07-01 12:00:00 [INFO] NGINX started successfully\n2023-07-01 12:01:00 [ERROR] NGINX configuration error\n"
}
```

### POST /api/v1/packageList
This endpoint allows you to install, remove or update a package on the server.

#### Request
```http
POST /api/v1/packageList
Content-Type: application/json

{
  "name": "nginx",
  "action": "install",
  "version": "1.18.0" # or latest
}
```

#### Response
```json
{
  "action: "success",
  "message": "Package nginx installed successfully"
}
```

### POST /api/v1/containers
This endpoint allows you to start, stop, restart or update a Docker container on the server.

#### Request
```http
POST /api/v1/containers
Content-Type: application/json

{
  "name": "nginx",
  "action": "upgrade",
  "image": "nginx:latest" # Optional, only used when action is upgrade
}
```

#### Response
```json
{
  "action": "success",
  "message": "Container nginx upgraded successfully"
}
```
