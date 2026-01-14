# Gitflow

At Renuo we follow [gitflow convention](http://nvie.com/posts/a-successful-git-branching-model/) and we use it in every project.
Please check it out and read how it works if you don’t know it yet.
It’s very important that you know how gitflow works to work at Renuo.

Since we follow gitflow, we have two main branches connected, via CD, to two servers, we call "main" and "develop".

```mermaid
graph LR
A[main] --> CI1(CI) --> CD1(CD)
CD1(CD) --> S11(server)
CD1(CD) --> S12(server)

    B[develop] --> CI2(CI) --> CD2(CD)
    CD2(CD) --> S21(server)
    CD2(CD) --> S22(server)

    B[develop] --> C[feature/1337-ff] --> CI3(CI)
```

```mermaid
sequenceDiagram
    actor Developer
    participant G as GitHub
    participant CI
    participant S as Server

    rect rgb(191, 223, 255)

    Developer->>G: git push origin develop or main
    G->>CI: notify about code change
    CI->>G: checkout code
    CI->>CI: run tests
    CI->>S: deploy
    end
```
