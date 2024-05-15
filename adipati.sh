#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SYSܓ�  A_�x�pW�ڊ����  D  � P @�ͭ�QL��ɦI�i��@�j )��ړ��SF��3$=G�=@i���0#�  �0I$���=C����@  @mImᲲ�|���l�2!��|)���0�ٗ�>��1G��)I�ۯfb���_�����o��L��?�7���gA&�_ �=n�#ջ��\���˜���4�1&�S;�^��("�$��aņ-�5���cMq�ޡe�v0ֆ�5�];�=���Ѓ�\�PXZ|ug�ê�I��c��w];���]��P�K�6��Mh`�T�()o��X0����ݕ�^H�b̉�W'��Fk� z̛4܀�r]��K�$�R9~]P����&F���DZΨ5�98Tyb������2Q�(�� �I%r�'̆�h�&E),,H!�l�vQs������<"�Q��NQcEZ�YռC(���K�%�[Ch�F)"�|��ʌ4fEEJ7�#U���D�WF�<�hm��g�6#�dj(G��� ���ֲ�A��.�p� ��'P