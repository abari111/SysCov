LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY op_part_tb IS
END op_part_tb;





ARCHITECTURE rtl OF op_part_tb IS
    COMPONENT operative_part IS
        PORT(
        clk       :IN STD_LOGIC;
        pwm_sig   :IN STD_LOGIC;
        en_mem    :IN STD_LOGIC;
        en_reg    :IN STD_LOGIC;
        en_reg8   :IN STD_LOGIC;
        rst_compt :IN STD_LOGIC;
        rst       :IN STD_LOGIC;
        en_compt  :IN STD_LOGIC;
        sel       :IN STD_LOGIC;
        demux_sel :IN STD_LOGIC;
        data      :IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        egal      :OUT STD_LOGIC;
        jour1     :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        jour2     :OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        max_nb    :OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        current_nb:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    END COMPONENT;
    SIGNAL clk,pwm_sig,en_mem,rst_compt,en_reg8,en_reg4,rst_reg8,en_compt,sel,demux_sel,egal:STD_LOGIC;
    SIGNAL jour1,jour2:STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL max_nb,current_nb:STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL data:STD_LOGIC_VECTOR(9 DOWNTO 0);
    BEGIN
        inst : operative_part PORT MAP(clk,pwm_sig,en_mem,en_reg4,en_reg8,rst_compt,rst_reg8,en_compt,
                   sel,demux_sel,data,egal,jour1,jour2,max_nb,current_nb);
        PROCESS
            BEGIN
            clk<='0';
            WAIT FOR 10 NS;
            clk<='1';
            WAIT FOR 10 NS;
        END PROCESS;
        
        PROCESS
            BEGIN
            pwm_sig<='0';
            WAIT FOR 20 NS;
            pwm_sig<='1';
            WAIT FOR 20 NS;
        END PROCESS;
        
        PROCESS 
            BEGIN
            
            data<="0000100000";
            en_reg4<='1';
            en_compt<='0';
            en_reg8<='0';
            en_mem<='0';
            sel<='0';
            rst_compt<='0';
            rst_reg8<='1';
            demux_sel<='0';
            WAIT FOR 30 NS;
            en_reg4<='0';
            en_compt<='1';
            rst_reg8<='0';
            WAIT FOR 160 NS;
            en_compt<='0';
            sel<='1';
            WAIT FOR 20 NS;
            en_reg8<='1';
            sel<='0';
            rst_compt<='1';
            WAIT FOR 30 NS;
            en_reg8<='0';
            en_compt<='1';
            rst_compt<='0';
            WAIT FOR 80 NS;
             en_compt<='0';
             sel<='1';
            WAIT FOR 20 NS;
             en_reg8<='1';
             sel<='0';
             rst_compt<='1';
            WAIT FOR 30 NS;
            en_mem<='1';
            WAIT FOR 20 NS;
            en_mem<='0';
            WAIT FOR 30 NS;
            
        END PROCESS;
        
    END rtl;
            
            
            
                
            