library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity d_not is
    port(
        E : in std_logic;
        S : out std_logic
    );
end entity d_not;

architecture door of d_not is
begin
    S <= not E;
end architecture door;


library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity not_block is
    port(
        E : in std_logic_vector(31 downto 0);
        S : out std_logic_vector(31 downto 0)
    );
end entity not_block;


architecture bh of not_block is
begin
    Generate_Nots : for ii in 0 to 31 generate
        not_generation : entity work.d_not
                port map(
                    E => E(ii),
                    S => S(ii)
                );
            end generate;
end architecture bh;