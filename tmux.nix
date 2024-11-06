{ config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    # Replace default prefix with ctrl+a
    shortcut = "a";
    baseIndex = 1;
    escapeTime = 0;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.catppuccin
      tmuxPlugins.better-mouse-mode
    ];
    extraConfig = ''
      # Splitting terminals using | and -
      bind '-' split-window -v -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"

      #Set bindinf for Copy/Paste
      bind C-c run "tmux save-buffer - | xclip -i -sel clipboard"
      bind C-v run 'tmux set-buffer "$(xclip -o -sel clipboard)"; tmux paste-buffer'

      #enable mouse support
      set -g mouse on
      set-option -sg escape-time 10
      set-option -g focus-events on

      run '~/.tmux/plugins/tpm/tpm'
    '';
  };
}
