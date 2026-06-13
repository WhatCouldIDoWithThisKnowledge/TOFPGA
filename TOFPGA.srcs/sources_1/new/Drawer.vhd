library IEEE;
use IEEE.std_logic_1164.all;

library work;


-- Add more inputs and outputs as they become needed;
entity Drawer is
    port(
        position_X : in std_logic_vector(10 downto 0);
        position_Y : in std_logic_vector(9 downto 0);
        stop : in std_logic;
        VGA : out std_logic_vector(12 downto 0)
    );
end entity Drawer;


architecture bh of Drawer is
begin
    
end architecture bh;