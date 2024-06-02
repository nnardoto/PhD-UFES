#!/bin/bash

wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/2f3a5785-1c41-4f65-a2f9-ddf9e0db3ea0/l_onemkl_p_2024.1.0.695_offline.sh
sudo sh ./_onemkl_p_2024.1.0.695_offline.sh -a -s --eula accept

wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/56b2dd0e-954d-4330-b0a7-b22992f7e6b7/l_mpi_oneapi_p_2021.12.1.8_offline.sh
sudo sh ./l_mpi_oneapi_p_2021.12.1.8_offline.sh -a -s --eula accept

wget https://registrationcenter-download.intel.com/akdlm/IRC_NAS/fd9342bd-7d50-442c-a3e4-f41974e14396/l_fortran-compiler_p_2024.1.0.465_offline.sh
sudo sh ./l_fortran-compiler_p_2024.1.0.465 -a -s --eula accept
