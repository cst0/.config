function fish_prompt
    powerline-shell --shell bare $status
end

set PATH $PATH /home/cst/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin
set PATH $PATH /home/cst/.cargo/bin

#set ROS_PACKAGE_VERSION 3
#source /opt/rosactive/sourceable.fish
bass source ws_melodic_py3/install/setup.bash

#source /opt/ros/melodic/share/rosbash/rosfish
#bass source /opt/ros/melodic/setup.bash
#set ROS_WORKSPACE /home/cst/ws_laserutils
