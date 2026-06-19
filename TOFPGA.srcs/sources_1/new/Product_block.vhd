library IEEE;
use IEEE.std_logic_1164.all;

library worK;

entity Product_block is
    port(
        E1, E2 : in std_logic_vector(31 downto 0);
        S : out std_logic_vector(31 downto 0)
    );
end entity Product_block;

architecture Mux of Product_block is
begin
    Generate_loop : for ii in 0 to 31 generate
        Product_gen : entity work.Product
            port map(
                E1 => E1(ii),
                E2 => E2(0),
                S => S(ii)
            );
    end generate Generate_loop;
end architecture Mux;


architecture bit_32 of Product_block is
begin
    Generate_loop : for ii in 0 to 31 generate
        Product_gen : entity work.Product
            port map(
                E1 => E1(ii),
                E2 => E2(ii),
                S => S(ii)
            );
        end generate Generate_loop;
end architecture bit_32;