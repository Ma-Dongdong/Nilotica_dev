@echo off
title Run market gateway
call .venv\Scripts\activate
python -m zmq_services.run_market_gateway
pause