{
  description = "flxke elixir-phoenix";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "github:flox/nixpkgs/unstable";
  outputs = {
    self,
    nixpkgs,
  }: let
    # to work with older version of flakes
    lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";

    # Generate a user-friendly version number.
    version = builtins.substring 0 8 lastModifiedDate;

    # System types to support.
    supportedSystems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];

    # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # Nixpkgs instantiated for supported system types.
    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    devShell = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};

      basePackages = with pkgs; [alejandra bat bats beam.packages.erlangR25.elixir_1_14 entr hivemind jq postgresql_14 graphviz python3];

      hooks = ''
        mkdir -p .nix-mix
        mkdir -p .nix-hex
        export MIX_HOME=$PWD/.nix-mix
        export HEX_HOME=$PWD/.nix-hex
        export PATH=$MIX_HOME/bin:$PATH
        export PATH=$HEX_HOME/bin:$PATH
        export LANG=C.UTF-8
        #export MIX_PATH="${pkgs.beam.packages.erlang.hex}/lib/erlang/lib/hex/ebin"
        #export PATH=$MIX_HOME/bin:$HEX_HOME/bin:$NIX_BIN_PATH:$PATH
        # Postgres environment variables
        export PGDATA=$PWD/postgres_data
        export PGHOST=$PWD/postgres
        export LOG_PATH=$PWD/postgres/LOG
        export PGDATABASE=postgres
        export DATABASE_URL="postgresql:///postgres?host=$PGHOST"
        if [ ! -d $PWD/postgres ]; then
          mkdir -p $PWD/postgres
        fi
        if [ ! -d $PGDATA ]; then
          echo 'Initializing postgresql database...'
          initdb $PGDATA --auth=trust >/dev/null
        fi        # As an example, you can run any CLI commands to customize your development shell
        #psql -p 5435 postgres -c 'create extension if not exists postgis' || true
        # This creates mix variables and data folders within your project, so as not to pollute your system
        echo 'To run the services configured here, you can run the `hivemind` command'
      '';
    in
      pkgs.mkShell {
        buildInputs = basePackages;
        shellHook = hooks;
      });
  };
}
