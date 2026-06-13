library IEEE;
use IEEE.std_logic_1164.all;

library work;

--FINISHED

entity D_ff is
    port(
        E : in std_logic;
        clk : in std_logic;
        rs : in std_logic;
        pr : in std_logic;
        enable : in std_logic;
        S : out std_logic;
        noS : out std_logic
    );
end entity D_ff;


architecture bh of D_ff is
signal helper: std_logic := '0';
begin
    helper <= (((E and clk) or pr) and not rs) and enable;
    S <= helper;
    noS <= not helper;
end architecture bh;