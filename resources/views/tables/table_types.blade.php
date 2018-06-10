
@for($i = 1; $i <= 13; $i++)
<tr>
    @for($j = 0; $j < 5; $j++)
        @if($i <= 13)
            <td><div id="cell_{{$i}}" class="redips-drag table_cr{{$i}} redips-clone"></div></td>
        @endif
        <?php $i++ ?>
    @endfor
    <?php $i-- ?>
</tr>
@endfor

