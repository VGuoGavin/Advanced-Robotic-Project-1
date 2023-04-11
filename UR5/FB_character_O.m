function res = FB_character_O(current_p, area_num, speed)

%p_end = FB_Move_2_area(current_p, 3, speed);  %先移动到对应单元格上方
%current_p = p_end;
next_p = [100;  50; -15; 20; 300; 10];
p_end = FB_current_2_next(current_p, next_p, 0.13, 0); %Put down and prepare to write

current_p = p_end;
next_p = [100;  32; -22; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  24; -38; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  22; -50; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  24; -62; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  32; -78; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  50; -85; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  68; -78; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  76; -62; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |


current_p = p_end;
next_p = [100;  78; -50; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  76; -38; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  68; -22; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

current_p = p_end;
next_p = [100;  49; -15; 20; 300; 10];
p_end = FB_current_2_next(current_p,next_p,speed, 1);  % The first line |

FB_character_W(current_p, area_num, 1)

end