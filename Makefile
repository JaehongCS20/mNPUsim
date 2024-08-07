SRCS = accelerator.h common.h main.cpp npu_accelerator.cpp npu_group.cpp software_request_generator.cpp util.cpp util.h util_os.cpp software_layer/*.cpp
MEMSRCS = address_translator.cpp address_translator.h memconfig.cpp memctrl.cpp memctrl.h memctrl_sharedtlb.cpp npumemconfig.cpp ptw.cpp ptw.h spm.cpp spm.h tlb.cpp tlb.h
LINK = -L./DRAMsim3/src/
LIB = -L./DRAMsim3 -ldramsim3
DEBUG = -g -O2

all: single

single:
	export LD_LIBRARY_PATH=./DRAMsim3:$$LD_LIBRARY_PATH &&\
	g++ $(LINK) $(DEBUG) $(SRCS) $(MEMSRCS) -o mnpusim -std=c++0x $(LIB)

clean:
	rm -rf mnpusim single_test1/ single_alexnet/

single_test1:
	export LD_LIBRARY_PATH=./DRAMsim3:$$LD_LIBRARY_PATH &&\
	./mnpusim arch_config/core_architecture_list/tpu.txt network_config/netconfig_list/single/test1_network.txt dram_config/total_dram_config/single_hbm2_256gbs.cfg npumem_config/npumem_architecture_list/single.txt single_test1 misc_config/single.cfg

single_alexnet:
	export LD_LIBRARY_PATH=./DRAMsim3:$$LD_LIBRARY_PATH &&\
	./mnpusim arch_config/core_architecture_list/tpu.txt network_config/netconfig_list/single/alexnet_out_im2col.txt dram_config/total_dram_config/single_hbm2_256gbs.cfg npumem_config/npumem_architecture_list/single.txt single_alexnet misc_config/single.cfg


gpt3-7b:
	export LD_LIBRARY_PATH=./DRAMsim3:$$LD_LIBRARY_PATH &&\
	./mnpusim arch_config/core_architecture_list/tpu.txt network_config/netconfig_list/single/gpt3-7b.txt dram_config/total_dram_config/single_hbm2_256gbs.cfg npumem_config/npumem_architecture_list/single.txt singe_gpt3-7b misc_config/single.cfg

gpt3-13b:
	export LD_LIBRARY_PATH=./DRAMsim3:$$LD_LIBRARY_PATH &&\
	./mnpusim arch_config/core_architecture_list/tpu.txt network_config/netconfig_list/single/gpt3-13b.txt dram_config/total_dram_config/single_hbm2_256gbs.cfg npumem_config/npumem_architecture_list/single.txt singe_gpt3-13b misc_config/single.cfg

gpt3-30b:
	export LD_LIBRARY_PATH=./DRAMsim3:$$LD_LIBRARY_PATH &&\
	./mnpusim arch_config/core_architecture_list/tpu.txt network_config/netconfig_list/single/gpt3-30b.txt dram_config/total_dram_config/single_hbm2_256gbs.cfg npumem_config/npumem_architecture_list/single.txt singe_gpt3-30b misc_config/single.cfg