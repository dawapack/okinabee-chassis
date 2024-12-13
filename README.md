# OkinaBee chassis

1. [About Okinabee Chassis](#about-project)
1. [Set up project](#set-up-project)
    * [Prerequisites](#prerequisites)
    * [Installation](#installation)
    * [Execute all tests](#execute-all-tests)
1. [License](#license)

## About
OkinaBee Chassis is a robust library designed to empower PHP developers in building scalable and maintainable
microservices. By leveraging the principles of Hexagonal Architecture, the library ensures clean separation of concerns,
enhanced testability, and flexibility in adapting to changing requirements.

### Key Features:

- **Hexagonal Architecture Core**: Streamlines the implementation of Ports and Adapters to achieve a clear boundary
between business logic and external systems.
- **Microservice Focus**: Tailored tools and utilities to facilitate the creation and management of independent,
lightweight services.
- **Developer-Friendly**: Intuitive APIs, comprehensive documentation, and best practices baked in to help developers
hit the ground running.
- **Scalability and Maintenance**: Encourages code structure that supports scalability and long-term maintenance.

Whether you are starting a new microservice from scratch or refactoring an existing system, Okinabee Chassis provides
the foundation for success.

## Set up project

### Prerequisites
- [Git](https://git-scm.com/downloads)
- [Docker & Docker Compose](https://docs.docker.com/compose/install/)

### Installation

Clone repository:

    git clone git@github.com:dawapack/okinabee-chassis.git
    cd okinabee-chassis

### Execute all tests

To run all the tests (unit tests, code coverage, code quality checker tools and code analysis tools)

    ./bin/run-suite.sh

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.