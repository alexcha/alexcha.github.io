---
title: awk 특수문자 쉽게 처리 하기
author: netggio
layout: post
permalink: /archives/2360
categories:
  - 일~일~일/linux
tags:
  - awk
  - 특수문자
---
&nbsp;

awk 사용시 .. 특수문자 인식시키려면.. ㄸㅏ음표와의 전쟁임..

아래 코드로 하면 간단하게 처리 가능.

<table border="0" width="360" cellspacing="0" cellpadding="0">
  <colgroup> <col span="5" width="72" /></colgroup> <tr>
    <td style="text-align: center;" width="72" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x21</span>
    </td>
    
    <td style="text-align: center;" width="72">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x22</span>
    </td>
    
    <td style="text-align: center;" width="72">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x23</span>
    </td>
    
    <td style="text-align: center;" width="72">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x24</span>
    </td>
    
    <td style="text-align: center;" width="72">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x25</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">!</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">&#8220;</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">#</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">$</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">%</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x26</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x27</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x28</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x29</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x2a</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">&</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">&#8216;</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">(</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">)</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">*</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x2b</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x2c</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x2d</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x2e</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x2f</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">+</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">,</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">&#8211;</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">.</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">/</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x30</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x31</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x32</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x33</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x34</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;"></span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">1</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">2</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">3</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">4</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x35</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x36</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x37</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x38</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x39</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">5</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">6</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">7</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">8</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">9</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x3a</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x3b</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x3c</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x3d</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x3e</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">:</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">;</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;"><</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">=</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">></span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x3f</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x40</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x41</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x42</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x43</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">?</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">@</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">A</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">B</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">C</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x44</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x45</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x46</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x47</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x48</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">D</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">E</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">F</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">G</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">H</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x49</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x4a</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x4b</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x4c</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x4d</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">I</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">J</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">K</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">L</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">M</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x4e</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x4f</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x50</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x51</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x52</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">N</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">O</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">P</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">Q</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">R</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x53</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x54</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x55</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x56</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x057</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">S</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">T</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">U</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">V</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">W</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x58</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x59</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x5a</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x5b</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x5c</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">X</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">Y</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">Z</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">[</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x5d</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x5e</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x5f</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x60</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x61</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">]</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">^</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">_</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">`</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">a</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x62</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x63</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x64</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x65</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x66</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">b</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">c</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">d</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">e</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">f</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x67</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x68</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x69</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x6a</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x6b</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">g</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">h</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">i</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">j</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">k</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x6c</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x6d</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x6e</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x6f</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x70</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">l</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">m</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">n</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">o</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">p</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x71</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x72</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x73</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x74</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x75</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">q</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">r</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">s</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">t</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">u</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x76</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x77</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x78</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x79</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x7a</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">v</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">w</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">x</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">y</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">z</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x7b</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x7c</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x7d</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">\x7e</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">　</span>
    </td>
  </tr>
  
  <tr>
    <td style="text-align: center;" height="22">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">{</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">|</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">}</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">~</span>
    </td>
    
    <td style="text-align: center;">
      <span style="color: #000000; font-family: 맑은 고딕; font-size: medium;">　</span>
    </td>
  </tr>
</table>

&nbsp;

&nbsp;

&nbsp;