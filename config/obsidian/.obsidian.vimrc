unmap <Space>

nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$

set clipboard=unnamed

exmap back obcommand app:go-back
nmap <C-o> :back<CR>

exmap forward obcommand app:go-forward
nmap <C-i> :forward<CR>

nmap <C-w>s :obcommand<space>workspace:split-horizontal<CR>
nmap <C-w>v :obcommand<space>workspace:split-vertical<CR>
nmap <C-w><C-s> :obcommand<space>workspace:split-horizontal<CR>
nmap <C-w><C-v> :obcommand<space>workspace:split-vertical<CR>

nmap <C-w>h :obcommand<space>editor:focus-left<CR>
nmap <C-w>j :obcommand<space>editor:focus-bottom<CR>
nmap <C-w>k :obcommand<space>editor:focus-top<CR>
nmap <C-w>l :obcommand<space>editor:focus-right<CR>
nmap <C-w><C-h> :obcommand<space>editor:focus-left<CR>
nmap <C-w><C-j> :obcommand<space>editor:focus-bottom<CR>
nmap <C-w><C-k> :obcommand<space>editor:focus-top<CR>
nmap <C-w><C-l> :obcommand<space>editor:focus-right<CR>

exmap toggleleft obcommand app:toggle-left-sidebar
nmap <Space>e :toggleleft<CR>

exmap togglecheck obcommand editor:toggle-checklist-status
nmap <Space>tt :togglecheck<CR>

exmap close obcommand workspace:close
nmap <Space>bd :close<CR>

exmap q obcommand workspace:close
exmap w obcommand editor:save-file
exmap wq obcommand workspace:close
exmap qa obcommand workspace:close-window

nnoremap <C-h> 5h
nnoremap <C-l> 5l
nnoremap <C-k> 5gk
nnoremap <C-j> 5gj

exmap settings obcommand app:open-settings
nmap <Space>s :settings<CR>

exmap commands obcommand command-palette:open
nmap <Space>: :commands<CR>

exmap files obcommand switcher:open
nmap <Space><Space> :files<CR>

exmap prevtab obcommand workspace:previous-tab
exmap nexttab obcommand workspace:next-tab
nmap H :prevtab<CR>
nmap L :nexttab<CR>
