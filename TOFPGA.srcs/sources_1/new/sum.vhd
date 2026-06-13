library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity sum_1_bit is
    port(
        E1 : in std_logic;
        E2 : in std_logic;
        carry_in : in std_logic;
        S : out std_logic;
        carry_out : out std_logic
    );
end entity sum_1_bit;

architecture bh of sum_1_bit is
begin
    S <= (E1 xor E2) xor carry_in;
    carry_out <= (E1 and E2) or (carry_in and E2) or (carry_in and E1);
end architecture bh;

library IEEE;
use IEEE.std_logic_1164.all;

entity sum is
    port(
        E1 : in std_logic_vector(31 downto 0);
        E2 : in std_logic_vector(31 downto 0);
        S : out std_logic_vector(31 downto 0);
        overflow : out std_logic
    );
end entity sum;

architecture bits_32 of sum is
signal helper : std_logic_vector(31 downto 0) := x"00000";
begin
    sum_1 : entity work.sum_1_bit
        port map(
            E1 => E1(0),
            E2 => E2(0),
            carry_in => '0',
            S => S(0),
            carry_out => helper(0)
        );
    Generate_For : for ii in 1 to 31 generate
    sum : entity work.sum_1_bit
        port map(
            E1 => E1(ii),
            E2 => E2(ii),
            carry_in => helper(ii - 1),
            S => S(ii),
            carry_out => helper(ii)
        );
    end generate;
end architecture bits_32;

architecture Ca2 of sum is
signal helper : std_logic_vector(31 downto 0) := x"00000";
begin
    sum_1 : entity work.sum_1_bit
        port map(
            E1 => E1(0),
            E2 => '1',
            carry_in => '0',
            S => S(0),
            carry_out => helper(0)
        );
    Generate_for : for ii in 1 to 31 generate
    sum : entity work.sum_1_bit
        port map(
            E1 => E1(ii),
            E2 => '0',
            carry_in => helper(ii - 1),
            S => S(ii),
            carry_out => helper(ii)            
        );
    end generate;
end architecture Ca2;