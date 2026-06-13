library IEEE;
use IEEE.std_logic_1164.all;

library work;

entity Divisor is
    port(
        num_X : in std_logic_vector(10 downto 0);
        num_Y : in std_logic_vector(9 downto 0)
    );
end entity Divisor;


-- Pasos:
  -- 1) Se debe pasar los numeros en Ca2 a positivos, guardando el signo. (Aqui solo esta el movimiento final, no los pasos intermedios).
  -- 2) Ambos numeros pasan por un encoder que nos dice cual es su bit mas alto, eso lo metemos a un comparador. Si nos da que son iguales,
       -- se baja bit por bit hasta que de algo decente. (Aqui los numeros siguen siendo de maximo 12 bits.
  -- 3) 
  -- 1) 
  -- 1) 
  -- 1) 
  
  -- Elementos necesarios:
    -- Ca2 Transformer  (Paso rapido de negativo a positivo).
    -- Comparador       (modificado, ver apuntes).
    -- Mux              (Para cambiar entre divisor y numerador segun sea necesario).
    -- Restador         (Para realizar la division, va en bucle).
    -- Buffer 32 bits   (Guarda el valor final del Bresenham inventado).
architecture bh of Divisor is
begin
    
end architecture bh;