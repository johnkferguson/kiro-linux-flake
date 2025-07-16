# Kiro Linux Flake

A Nix flake for [Kiro](https://kiro.dev/) - an AI-powered IDE based on VSCode.

## Installation

### Using Nix Flakes

```bash
# Install directly
nix profile install github:johnkferguson/kiro-linux-flake

# Or run without installing
nix run github:johnkferguson/kiro-linux-flake
```

### Using flake.nix in your system configuration

Add to your `flake.nix` inputs:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    kiro.url = "github:johnkferguson/kiro-linux-flake";
  };
}
```

Then add to your packages:

```nix
environment.systemPackages = [
  inputs.kiro.packages.${system}.default
];
```

## Requirements

- x86_64-Linux system (currently the only supported platform)
- Nix with flakes enabled

## About

Kiro is an AI-powered IDE that enhances the VSCode experience with advanced AI capabilities. This flake packages the official Linux release for easy installation and management through Nix.

## License

Kiro is proprietary software. This flake is provided for convenience and follows the upstream licensing terms.