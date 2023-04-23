function [binMatrix] = imageSpectrum(imageMatrix, binCount)

    PixelValue = [0:1:255];
    [numRow,numCol] = size(imageMatrix);
    Flag1 = 0;
    Flag3 = 0;
    Restrict = 255/binCount;
    FlagTest = 0;
    FlagTest1 = 0;

%Error
    for Count1 = [1:numRow]
      for Count2 = [1:numCol]
        if (imageMatrix(Count1,Count2) > 255) || (imageMatrix(Count1,Count2) < 0)
          Flag3 = Flag3 + 1;
        end
      end
    end

    if sum(Flag3) > 0
      binMatrix = -99;
    else
      FlagTest1 = 1;
    end

    if FlagTest1 == 1
      fractionalTest = fix(binCount) - binCount;
      if fractionalTest != 0
        binMatrix = -99;
      else
        FlagTest = 1;
      end
    end

%Inspection
    if FlagTest == 1
      for Count1 = [1:numRow]
        for Count2 = [1:numCol]
          if (imageMatrix(Count1,Count2) >= 0) && (imageMatrix(Count1,Count2) <= floor(Restrict))
            Flag1 = Flag1 + 1;
          end
        end
      end
      binMatrix = Flag1;

      for Count3 = [1:binCount-1]
        Flag2 = 0;
        for Count1 = [1:numRow]
          for Count2 = [1:numCol]
            if (imageMatrix(Count1,Count2) >= (Count3*floor(Restrict))+1*Count3) && (imageMatrix(Count1,Count2) <= (floor(Restrict)+((Count3*floor(Restrict))+1*Count3)))
              Flag2 = Flag2 + 1;
            end
          end
        end
        binMatrix = [binMatrix Flag2];
      end
    end

















