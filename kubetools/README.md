
# Docker Run

```bash
docker run -it \
  --rm \
  --privileged \
  --network=host \
  --name kubetools \
  -v ~/.kube/config:/root/.kube/config \
  ghcr.io/lqshow/dockerfiles/kubetools:0.0.1 \
  zsh
```

## References

- [kubectl with plugins and auto-completion](https://github.com/Piotr1215/kubectl-container)
