@echo off
title Run data recorder
call .venv\Scripts\activate
python -m zmq_services.run_data_recorder
pause