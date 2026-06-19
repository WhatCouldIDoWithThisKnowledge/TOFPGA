library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Adder is
    port(
        E1, E2, iov : in std_logic;
        S, ov : out std_logic
    );
end entity Adder;

architecture sum of Adder is
signal helper : std_logic := '0';
begin
    helper <= (E1 xor E2);
    S <= helper xor iov;
    ov <= (E1 and E2) or (iov and helper);
end architecture sum;