library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Adder_block is
    port(
        E1, E2 : in std_logic_vector(31 downto 0);
        S : out std_logic_vector(31 downto 0);
        ov : out std_logic
    );
end entity Adder_block;

architecture bit_32 of Adder_block is
signal helper : std_logic_vector(31 downto 0) := x"00000";
begin
    Adder :entity work.adder
        port map(
            E1 => E1(0),
            E2 => E2(0),
            S => S(0),
            ov => helper(0),
            iov => '0'
        );
    Generate_loop : for ii in 1 to 31 generate
        adder_gen : entity work.adder
            port map(
                E1 => E1(ii),
                E2 => E2(ii),
                S => S(ii),
                ov => ov,
                iov => helper(ii - 1)
            );
        end generate Generate_loop;
end architecture bit_32;