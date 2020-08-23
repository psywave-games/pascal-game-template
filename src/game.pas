program audio_music_stream;

{$MODE objfpc}

uses cmem, raylib, math;

const
    screenWidth = 800;
    screenHeight = 450;

var
    pause : boolean = false;

begin
    {$IFDEF DARWIN}
    SetExceptionMask([exDenormalized,exInvalidOp,exOverflow,exPrecision,exUnderflow,exZeroDivide]);
    {$IFEND}
    // options 
    InitWindow(screenWidth, screenHeight, 'Game Title');
    SetTargetFPS(60);
    while  not WindowShouldClose() do begin
        // gameplay
        if not pause then begin


        end;
        // rendering
        BeginDrawing();
        ClearBackground(BLACK);
      
        EndDrawing();
    end;
    CloseWindow();
end.