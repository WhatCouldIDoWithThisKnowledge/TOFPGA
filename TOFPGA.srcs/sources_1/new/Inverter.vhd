library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Inverter is
    port(
        E : in std_logic;
        S : out std_logic
    );
end entity Inverter;

architecture bh of Inverter is
begin
    S <= not E;
end architecture bh;