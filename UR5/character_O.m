function res = character_O(current_q, area_num, speed)

%q_end = Move_2_area(current_q, 3,speed);  %先移动到对应单元格上方
current_q = current_q;
next_p = [100;  50; -15; 20; 300; 10];
q_end = current_2_next(current_q, next_p, 0.13, 0); %Put down and prepare to write

current_q = q_end;
next_p = [100;  32; -22; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  24; -38; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  22; -50; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  24; -62; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  32; -78; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  50; -85; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  68; -78; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  76; -62; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |


current_q = q_end;
next_p = [100;  78; -50; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  76; -38; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  68; -22; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

current_q = q_end;
next_p = [100;  49; -15; 20; 300; 10];
q_end = current_2_next(current_q,next_p,speed, 1);  % The first line |

res = character_W(current_q, area_num, 0.08);

end