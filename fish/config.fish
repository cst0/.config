function fish_prompt
    powerline-shell --shell bare $status
end

# fixes clang path
set PATH $PATH /home/cst/.config/coc/extensions/coc-clangd-data/install/11.0.0/clangd_11.0.0/bin
# provide access to rust binaries (only pyoxidizer, can probably clean this up?)
set PATH $PATH /home/cst/.cargo/bin

#set ROS_PACKAGE_VERSION 3
#source /opt/rosactive/sourceable.fish
#bass source ~/ws_melodic_py3/devel/setup.bash
bass source /opt/ros/melodic/setup.bash
bass source ~/ws_releases/devel/setup.bash --extend
bass source ~/ws_scratchpad/devel/setup.bash --extend

#source /opt/ros/melodic/share/rosbash/rosfish
#bass source /opt/ros/melodic/setup.bash
#set ROS_WORKSPACE /home/cst/ws_laserutils
