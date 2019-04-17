var
ks: array [0..8] of real;


  kolp: array [1..8] of real;


  bn, kol, eksp, pr, mkpr, koleksp, preksp: real;


  nb, i : integer;
  h : string;

begin
  kol := 1;
  ks[1] := 5;
  ks[2] := 30;
  ks[3] := 144;
  ks[4] := 432;
  ks[5] := 70;
  ks[6] := 150;
  ks[7] := 32
  ks[8] := 600;
  kolp[1] := 1;
  kolp[2] := 5;
  kolp[3] := 20;
  kolp[4] := 50;
  kolp[5] := 20;
  kolp[6] := 90;
  kolp[7] := 324;
  kolp[8] := 729;
  writeln('____________________________________________________');
  write('коефицент увеличения стоимости-');
  readln(eksp);
  write('коефицент увеличения дохода-');
  readln(koleksp);
  write('коефицент уменьшения престижа-');
  readln(preksp);
  write('количество пристижа для победы-');
  readln(mkpr);
  writeln('____________________________________________________');
  repeat
    i  := i + 1 ;
    bn := kol + bn;
    writeln('____________________________________________________');
    writeln('ваши накопления-', bn);
    writeln('ваш доход-', kol);
    writeln('ваши очки пристижа-', pr);
    writeln('ваши действия');
    writeln('1. подождать');
    writeln('2. купить производства');
    writeln('3. купить пристиж');
    writeln('____________________________________________________');
    write('ваш выбор-');
    readln(nb);
    if nb = 2 then 
    begin
      repeat
        writeln('____________________________________________________');
        writeln('ваши действия');
        writeln('1. назад');
        writeln('2. лесопилка доход-',kolp[1],', стоимость-', ks[1]);
        writeln('3. каменая оброботка доход-',kolp[2],', стоимость-', ks[2]);
        writeln('4. опреснение воды доход-',kolp[3],', стоимость-', ks[3]);
        writeln('5. ювелирка доход-',kolp[4],', стоимость-', ks[4]);
        writeln('____________________________________________________');
        write('ваш выбор-');
        readln(nb);
        if (nb > 1) and (nb < 6) then
        begin
          ks[0] := ks[nb - 1];
        end
        else begin
          ks[0] := 0
        end;
      until(bn - ks[0] >= 0);
      bn := bn - ks[0];
      if (nb > 1) and (nb < 6) then
      begin
        ks[nb - 1] := ks[nb - 1] * eksp;
        kol := kol + kolp[nb - 1];
        kolp[nb - 1] := kolp[nb - 1] * koleksp;
      end;
      nb := 0;
    end;
    if nb = 3 then begin
      repeat
        writeln('____________________________________________________');
        writeln('ваши действия');
        writeln('1. назад');
        writeln('2. одежда расход-',kolp[5],', стоимость-', ks[5]);
        writeln('3. телефон расход-',kolp[6],', стоимость-', ks[6]);
        writeln('4. машина расход-',kolp[7],', стоимость-', ks[7]);
        writeln('5. дом расход-',kolp[8],', стоимость-', ks[8]);
        writeln('____________________________________________________');
        write('ваш выбор-');
        readln(nb);
        if (nb > 1) and (nb < 6) then
        begin
          ks[0] := ks[nb + 3];
        end
        else
        begin
          ks[0] := 0
        end;
      until(bn - ks[0] >= 0);
      bn := bn - ks[0];
      if (nb > 1) and (nb < 6) then
      begin
        ks[nb + 3] := ks[nb + 3] * eksp * 2;
        pr := pr + kolp[nb + 3];
        kolp[nb + 3] := kolp[nb + 3] / preksp ;
      end;
      nb := 0;
    end;
  until (mkpr = pr) or (bn < 0);
  if (mkpr = pr) then 
  begin
    writeln('вы выйгроли');
    writeln('количество шагов-',i);
  end;
  if (bn < 0) then 
  begin
    writeln('вы проиграли');
  end;
  write('напиши что то что-бы законьчить');
  read(h);
end.
