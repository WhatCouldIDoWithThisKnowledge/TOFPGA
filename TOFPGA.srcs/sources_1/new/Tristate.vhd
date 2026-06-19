library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Tristate is
    port(
        E, enable : in std_logic;
        S : out std_logic
    );
end entity Tristate;


architecture bh of Tristate is
begin
    S <= E when enable = '1' else 'H';
end architecture bh;