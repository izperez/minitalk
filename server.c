/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: izperez <izperez@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/11 12:39:43 by izperez           #+#    #+#             */
/*   Updated: 2024/02/01 11:09:58 by izperez          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	binary_to_text(int signum)
{
	static int	byte;
	static int	i;

	if (signum == SIGUSR1)
		byte |= (0x01 << i);
	i++;
	if (i == 8)
	{
		ft_printf("%c", byte);
		i = 0;
		byte = 0;
	}
}

static void	get_pid(void)
{
	int	pid;

	pid = getpid();
	if (pid == 0)
		ft_printf (ERROR "\033[35mPID has not been generated\033[0m\n");
	else
		ft_printf("PID is: %i\n", pid);
}

int	main(void)
{
	get_pid();
	ft_printf("Waiting...\n");
	while (1)
	{
		signal(SIGUSR1, binary_to_text);
		signal(SIGUSR2, binary_to_text);
		pause();
	}
	return (0);
}
