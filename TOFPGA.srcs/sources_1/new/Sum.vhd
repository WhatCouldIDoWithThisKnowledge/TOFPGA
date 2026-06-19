library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Sum is
    port(
        E1, E2: in std_logic;
        S : out std_logic
    );
end entity Sum;

architecture bh of Sum is
begin
    S <= E1 or E2;
end architecture bh;